CREATE OR REPLACE
"package body dh_util is
"
"  result   varchar2(2000);
"
"  working_integer        number;
"
"  working_decimal        varchar2(100);
"
"  working_dec_mag        number;
"
"  working_integer_spell  varchar2(2000);
"
"  working_decimal_spell  varchar2(2000);
"
"  working_fraction_spell varchar2(2000);
"
"  type number_stencil is table of number
"
"       index by binary_integer;
"
"  type varchar2_stencil is table of varchar2(2000)
"
"       index by binary_integer;
"
"  denom varchar2_stencil;
"
"  pad_factor number_stencil;
"
"  hold varchar2_stencil;
"
"--  **************************************************************
"
"--  Packaged Global Function Definition: DH_UTIL.SPELL
"
"--  **************************************************************
"
"function spell (x in number) return varchar2 is
"
"--  **************************************************************
"
"--  Local Function Specification: WORDING
"
"--  **************************************************************
"
"  function wording (x in number) return varchar2 is
"
"  begin
"
"     if x = 0 then
"
"        return 'Zero';
"
"     else
"
"        return to_char(to_date(x,'j'),'Jsp'); -- Numbers-to-words
"
"     end if;
"
"  end wording;
"
"--  **************************************************************
"
"--  Local Function Specification: INTEGER_TRANSLATION
"
"--  **************************************************************
"
"  function integer_translation (working_x in number)
"
"           return varchar2 is
"
"     x_char varchar2(128);
"
"     denoms_to_do number;
"
"     start_byte   number;
"
"     pointer      binary_integer;
"
"     interim_spelling varchar2(2000);
"
"  begin
"
"     if working_x is null then
"
"        return 'Null';
"
"     elsif working_x = 0 then
"
"        return 'Zero';
"
"     end if;
"
"     x_char := abs(working_x);
"
"     pointer := 3-mod(length(x_char),3);
"
"     x_char := lpad(x_char,length(x_char)+pad_factor(pointer),'0');
"
"     denoms_to_do := length(x_char)/3;
"
"     result := null;
"
"     for i in 1..denoms_to_do loop
"
"         start_byte := ((i-1)*3)+1;
"
"         interim_spelling := wording(substr(x_char,start_byte,3));
"
"         pointer := (denoms_to_do+1)-i;
"
"         if upper(interim_spelling) <> 'ZERO' then
"
"            result := rtrim(ltrim(result||' '||interim_spelling||
"
"               ' '||denom(pointer)));
"
"         end if;
"
"         hold(i) := result;
"
"     end loop;
"
"     return result;
"
"  end integer_translation;
"
"--  **************************************************************
"
"--  Global Function SPELL Procedural Section
"
"--  **************************************************************
"
"begin
"
"  working_integer_spell := null;
"
"  working_decimal_spell := null;
"
"  working_fraction_spell := null;
"
"  working_integer := trunc(x);
"
"  if abs(x) > abs(working_integer) then
"
"     working_decimal :=
"
"       substr(rtrim(to_char(abs(x)-abs(working_integer),
"
"       '.00000000000000000000000000000000000000000'),
"
"       '0'),3);
"
"  else
"
"     working_decimal := null;
"
"     working_dec_mag := null;
"
"  end if;
"
"  working_integer_spell := integer_translation(working_integer);
"
"  if working_decimal is not null then
"
"     working_dec_mag := 10 ** length(working_decimal);
"
"     working_decimal_spell :=
"
"        ' and '||integer_translation(working_decimal);
"
"     working_fraction_spell :=
"
"        integer_translation(working_dec_mag)||'th';
"
"     if working_decimal > 1 then
"
"        working_fraction_spell := working_fraction_spell||'s';
"
"     end if;
"
"     if upper(substr(working_fraction_spell,1,3))='ONE' then
"
"        working_fraction_spell := substr(working_fraction_spell,5);
"
"     end if;
"
"     working_fraction_spell := ' / '||working_fraction_spell;
"
"  end if;
"
"  if working_integer = 0 and working_decimal_spell is not null then
"
"     result := substr(working_decimal_spell,5)||
"
"        working_fraction_spell;
"
"  else
"
"     result := working_integer_spell||
"
"        working_decimal_spell||working_fraction_spell;
"
"  end if;
"
"  if x < 0 then
"
"     result := 'Negative '||result;
"
"  end if;
"
"  result := replace(result,'  ',' ');
"
"  return result;
"
"end spell;
"
"--  **************************************************************
"
"--  End of Global Function: SPELL
"
"--  **************************************************************
"
"--  **************************************************************
"
"--  Global Function Specification: CHECK_PROTECT
"
"--  **************************************************************
"
"function check_protect (x in number) return varchar2 is
"
"   hold_dollar number;
"
"   hold_cents  number;
"
"   function check_for_single (y in number, currency in varchar2)
"
"      return varchar2 is
"
"   begin
"
"      if y = 1 then
"
"         return 'One '||currency;
"
"      else
"
"         return spell(y) ||' '||currency||'s';
"
"      end if;
"
"   end;
"
"begin
"
"   if x is null then
"
"      return 'Non Negotiable';
"
"   end if;
"
"   hold_dollar := trunc(x);
"
"   hold_cents  := (abs(x) - trunc(abs(x)))*100;
"
"   return check_for_single(hold_dollar,'Dollar')||' and '||
"
"          check_for_single(hold_cents,'Cent');
"
"end check_protect;
"
"--  **************************************************************
"
"--  ""First-time-only"" Package Initialization activities
"
"--  **************************************************************
"
"begin
"
"   pad_factor(1) := 1;
"
"   pad_factor(2) := 2;
"
"   pad_factor(3) := 0;
"
"   denom(1) := null;
"
"   denom(2) := 'Thousand';
"
"   denom(3) := 'Million';
"
"   denom(4) := 'Billion';
"
"   denom(5) := 'Trillion';
"
"   denom(6) := 'Quadrillion';
"
"   denom(7) := 'Quintillion';
"
"   denom(8) := 'Sextillion';
"
"   denom(9) := 'Septillion';
"
"   denom(10) := 'Octillion';
"
"   denom(11) := 'Nonillion';
"
"   denom(12) := 'Decillion';
"
"   denom(13) := 'Undecillion';
"
"   denom(14) := 'Duodecillion';
"
"   denom(15) := 'Tredecillion';
"
"   denom(16) := 'Quattuordecillion';
"
"   denom(17) := 'Quindecillion';
"
"   denom(18) := 'Sexdecillion';
"
"   denom(19) := 'Septendecillion';
"
"   denom(20) := 'Octodecillion';
"
"   denom(21) := 'Novemdecillion';
"
"   denom(22) := 'Vigintillion';
"
"   denom(23) := 'Unvigintillion';
"
"   denom(24) := 'Duovigintillion';
"
"   denom(25) := 'Trevigintillion';
"
"   denom(26) := 'Quattuorvigintillion';
"
"   denom(27) := 'Quinvigintillion';
"
"   denom(28) := 'Sexvigintillion';
"
"   denom(29) := 'Septenvigintillion';
"
"   denom(30) := 'Octovigintillion';
"
"   denom(31) := 'Novemvigintillion';
"
"   denom(32) := 'Tregintillion';
"
"   denom(33) := 'Untregintillion';
"
"   denom(34) := 'Duotregintillion';
"
"end dh_util;
"
"--  **************************************************************
"
"--  End of Global Function: SPELL
"
"--  **************************************************************"
/
