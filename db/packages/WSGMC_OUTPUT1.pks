CREATE OR REPLACE
"package WSGMC_OUTPUT1 is
"
"  -- make sure we don't keep this around after a call
"
"  pragma SERIALLY_REUSABLE;
"
"
"
"  procedure Before (pRef in WSGOC.COMPONENT_REF, pDepth in number);
"
"  procedure After (pRef in WSGOC.COMPONENT_REF, pDepth in number);
"
"end;"
/
