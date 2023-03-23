library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity tabla_caract is 
port (  
    codigo_char     : in std_logic_vector (6 downto 0);
    char            : out std_logic_vector (63 downto 0)
);
end tabla_caract;
architecture solucion of tabla_caract is
signal codigo_char_e : std_logic_vector (6 downto 0);
    begin 
  
    codigo_char_e  <=  ( unsigned(codigo_char));
    with codigo_char_e select
    char <=    x"0000000000000000"  when  0,      
               x"7e81a581bd99817e"  when  1, 
               x"7effdbffc3e7ff7e"  when  2, 
               x"6cfefefe7c381000"  when  3, 
               x"10387cfe7c381000"  when  4, 
               x"387c38fefed61038"  when  5, 
               x"1010387cfe7c1038"  when  6, 
               x"0000183c3c180000"  when  7, 
               x"ffffe7c3c3e7ffff"  when  8, 
               x"003c664242663c00"  when  9,
               x"ffc399bdbd99c3ff"  when  10, 
               x"0f070f7dcccccc78"  when  11, 
               x"3c6666663c187e18"  when  12, 
               x"3f333f303070f0e0"  when  13, 
               x"7f637f636367e6c0"  when  14, 
               x"995a3ce7e73c5a99"  when  15, 
               x"80e0f8fef8e08000"  when  16, 
               x"020e3efe3e0e0200"  when  17, 
               x"183c7e18187e3c18"  when  18, 
               x"6666666666006600"  when  19, 
               x"7fdbdb7b1b1b1b00"  when  20, 
               x"7ec378cccc788cf8"  when  21, 
               x"000000007e7e7e00"  when  22, 
               x"183c7e187e3c18ff"  when  23, 
               x"183c7e1818181800"  when  24, 
               x"181818187e3c1800"  when  25, 
               x"00180cfe0c180000"  when  26, 
               x"003060fe60300000"  when  27, 
               x"0000c0c0c0fe0000"  when  28, 
               x"002466ff66240000"  when  29, 
               x"00183c7effff0000"  when  30, 
               x"00ffff7e3c180000"  when  31, 
               x"0000000000000000"  when  32, 
               x"3078783030003000"  when  33, 
               x"6c6c6c0000000000"  when  34, 
               x"6c6cfe6cfe6c6c00"  when  35, 
               x"307cc0780cf83000"  when  36, 
               x"00c6cc183066c600"  when  37, 
               x"386c3876dccc7600"  when  38, 
               x"6060c00000000000"  when  39, 
               x"1830606060301800"  when  40, 
               x"6030181818306000"  when  41, 
               x"00663cff3c660000"  when  42, 
               x"003030fc30300000"  when  43, 
               x"0000000000703060"  when  44, 
               x"000000fc00000000"  when  45, 
               x"0000000000303000"  when  46, 
               x"060c183060c08000"  when  47, 
               x"78ccdcfceccc7800"  when  48, 
               x"30f030303030fc00"  when  49, 
               x"78cc0c3860ccfc00"  when  50, 
               x"78cc0c380ccc7800"  when  51, 
               x"1c3c6cccfe0c0c00"  when  52, 
               x"fcc0f80c0ccc7800"  when  53, 
               x"3860c0f8cccc7800"  when  54, 
               x"fccc0c1830606000"  when  55, 
               x"78cccc78cccc7800"  when  56, 
               x"78cccc7c0c187000"  when  57, 
               x"0000303000303000"  when  58, 
               x"0000303000703060"  when  59, 
               x"183060c060301800"  when  60, 
               x"0000fc00fc000000"  when  61, 
               x"6030180c18306000"  when  62, 
               x"78cc0c1830003000"  when  63, 
               x"7cc6dededec07800"  when  64, 
               x"3078ccccfccccc00"  when  65, 
               x"fc66667c6666fc00"  when  66, 
               x"3c66c0c0c0663c00"  when  67, 
               x"fc6c6666666cfc00"  when  68, 
               x"fe6268786862fe00"  when  69, 
               x"fe6268786860f000"  when  70, 
               x"3c66c0c0ce663e00"  when  71, 
               x"ccccccfccccccc00"  when  72, 
               x"7830303030307800"  when  73, 
               x"1e0c0c0ccccc7800"  when  74, 
               x"e6666c786c66e600"  when  75, 
               x"f06060606266fe00"  when  76, 
               x"c6eefed6c6c6c600"  when  77, 
               x"c6e6f6decec6c600"  when  78, 
               x"386cc6c6c66c3800"  when  79, 
               x"fc66667c6060f000"  when  80, 
               x"78ccccccdc781c00"  when  81, 
               x"fc66667c786ce600"  when  82, 
               x"78cce0381ccc7800"  when  83, 
               x"fcb4303030307800"  when  84, 
               x"ccccccccccccfc00"  when  85, 
               x"cccccccccc783000"  when  86, 
               x"c6c6c6d6feeec600"  when  87, 
               x"c6c66c386cc6c600"  when  88, 
               x"cccccc7830307800"  when  89, 
               x"fecc983062c6fe00"  when  90, 
               x"7860606060607800"  when  91, 
               x"c06030180c060200"  when  92, 
               x"7818181818187800"  when  93, 
               x"10386cc600000000"  when  94, 
               x"00000000000000ff"  when  95,
               x"3030180000000000"  when  96, 
               x"0000780c7ccc7600"  when  97, 
               x"e0607c666666bc00"  when  98, 
               x"000078ccc0cc7800"  when  99, 
               x"1c0c0c7ccccc7600"  when  100, 
               x"000078ccfcc07800"  when  101, 
               x"386c60f06060f000"  when  102, 
               x"000076cccc7c0cf8"  when  103, 
               x"e0606c766666e600"  when  104, 
               x"3000703030307800"  when  105, 
               x"180078181818d870"  when  106, 
               x"e060666c786ce600"  when  107, 
               x"7030303030307800"  when  108, 
               x"0000ecfed6c6c600"  when  109, 
               x"0000f8cccccccc00"  when  110, 
               x"000078cccccc7800"  when  111, 
               x"0000dc66667c60f0"  when  112, 
               x"000076cccc7c0c1e"  when  113, 
               x"0000d86c6c60f000"  when  114, 
               x"00007cc0780cf800"  when  115, 
               x"10307c3030341800"  when  116, 
               x"0000cccccccc7600"  when  117, 
               x"0000cccccc783000"  when  118, 
               x"0000c6c6d6fe6c00"  when  119, 
               x"0000c66c386cc600"  when  120, 
               x"0000cccccc7c0cf8"  when  121, 
               x"0000fc983064fc00"  when  122, 
               x"1c3030e030301c00"  when  123, 
               x"1818180018181800"  when  124, 
               x"e030301c3030e000"  when  125, 
               x"76dc000000000000"  when  126, 
               x"10386cc6c6c6fe00"  when  127, 
               x"ffffffffffffffff"  when others;
    

end solucion;