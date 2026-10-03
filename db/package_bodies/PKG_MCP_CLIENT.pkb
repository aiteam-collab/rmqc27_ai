CREATE OR REPLACE
"PACKAGE BODY pkg_mcp_client AS
"
"
"
"  g_tools_cache  CLOB;
"
"  g_tools_time   DATE;
"
"
"
"  FUNCTION rpc (p_method IN VARCHAR2, p_params IN json_object_t) RETURN json_object_t IS
"
"    l_req  json_object_t := json_object_t();
"
"    l_resp CLOB;
"
"  BEGIN
"
"    l_req.put('jsonrpc', '2.0');
"
"    l_req.put('id',      LOWER(RAWTOHEX(SYS_GUID())));
"
"    l_req.put('method',  p_method);
"
"    IF p_params IS NULL THEN
"
"      l_req.put('params', json_object_t());
"
"    ELSE
"
"      l_req.put('params', p_params);
"
"    END IF;
"
"
"
"    apex_web_service.clear_request_headers;
"
"    apex_web_service.set_request_headers(
"
"      p_name_01  => 'Content-Type',         p_value_01 => 'application/json',
"
"      p_name_02  => 'Accept',               p_value_02 => 'application/json, text/event-stream',
"
"      p_name_03  => 'MCP-Protocol-Version', p_value_03 => c_protocol,
"
"      p_reset    => TRUE );
"
"
"
"    l_resp := apex_web_service.make_rest_request(
"
"                p_url                  => c_endpoint,
"
"                p_http_method          => 'POST',
"
"                p_body                 => l_req.to_clob,
"
"                p_credential_static_id => c_credential,
"
"                p_token_url            => c_token_url,
"
"                p_transfer_timeout     => 60 );
"
"
"
"    IF apex_web_service.g_status_code <> 200 THEN
"
"      raise_application_error(-20510,
"
"        'MCP server returned HTTP ' || apex_web_service.g_status_code || ': '
"
"        || dbms_lob.substr(l_resp, 400, 1));
"
"    END IF;
"
"
"
"    RETURN json_object_t.parse(l_resp);
"
"  END rpc;
"
"
"
"  FUNCTION call_tool (p_tool_name IN VARCHAR2, p_arguments IN CLOB DEFAULT '{}') RETURN CLOB IS
"
"    l_params  json_object_t := json_object_t();
"
"    l_meta    json_object_t := json_object_t();
"
"    l_resp    json_object_t;
"
"    l_result  json_object_t;
"
"    l_content json_array_t;
"
"    l_item    json_object_t;
"
"    l_out     CLOB;
"
"    l_user    VARCHAR2(100) := SYS_CONTEXT('APEX$SESSION', 'APP_USER');
"
"    l_bu      VARCHAR2(30)  := pkg_ai_sec.get_bu;
"
"  BEGIN
"
"    IF l_user IS NULL THEN
"
"      raise_application_error(-20511, 'pkg_mcp_client.call_tool must run inside an APEX session.');
"
"    END IF;
"
"
"
"    -- Identity travels in _meta; the server trusts it only for delegate clients
"
"    -- and re-validates the user/BU pair against MCP_USER_BU.
"
"    l_meta.put('roadmap/erp_user',     l_user);
"
"    l_meta.put('roadmap/bu',           l_bu);
"
"    l_meta.put('roadmap/apex_session', SYS_CONTEXT('APEX$SESSION', 'APP_SESSION'));
"
"
"
"    l_params.put('name',      p_tool_name);
"
"    l_params.put('arguments', json_object_t.parse(NVL(p_arguments, '{}')));
"
"    l_params.put('_meta',     l_meta);
"
"
"
"    l_resp := rpc('tools/call', l_params);
"
"
"
"    IF l_resp.has('error') THEN
"
"      RETURN 'ERP SERVICE ERROR: ' || l_resp.get_object('error').get_string('message')
"
"          || '. Tell the user this request could not be completed; do not guess any figures.';
"
"    END IF;
"
"
"
"    l_result  := l_resp.get_object('result');
"
"    l_content := l_result.get_array('content');
"
"    IF l_content IS NOT NULL THEN
"
"      FOR i IN 0 .. l_content.get_size - 1 LOOP
"
"        l_item := TREAT(l_content.get(i) AS json_object_t);
"
"        IF l_item.get_string('type') = 'text' THEN
"
"          l_out := l_out || l_item.get_clob('text');
"
"        END IF;
"
"      END LOOP;
"
"    END IF;
"
"
"
"    IF NVL(l_result.get_boolean('isError'), FALSE) THEN
"
"      RETURN 'TOOL ERROR: ' || l_out;
"
"    END IF;
"
"    RETURN l_out;
"
"  END call_tool;
"
"
"
"  FUNCTION list_tools_text RETURN CLOB IS
"
"    l_resp  json_object_t;
"
"    l_tools json_array_t;
"
"    l_t     json_object_t;
"
"    l_out   CLOB;
"
"  BEGIN
"
"    IF g_tools_cache IS NOT NULL AND g_tools_time > SYSDATE - 10/1440 THEN
"
"      RETURN g_tools_cache;
"
"    END IF;
"
"
"
"    l_resp  := rpc('tools/list', json_object_t());
"
"    l_tools := l_resp.get_object('result').get_array('tools');
"
"    FOR i IN 0 .. l_tools.get_size - 1 LOOP
"
"      l_t   := TREAT(l_tools.get(i) AS json_object_t);
"
"      l_out := l_out || '- ' || l_t.get_string('name') || ': ' || l_t.get_string('description')
"
"               || ' | arguments JSON schema: ' || l_t.get_object('inputSchema').to_string || CHR(10);
"
"    END LOOP;
"
"
"
"    g_tools_cache := l_out;
"
"    g_tools_time  := SYSDATE;
"
"    RETURN l_out;
"
"  END list_tools_text;
"
"
"
"END pkg_mcp_client;"
/
