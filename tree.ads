with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists;

package Tree is

    --Max tree size
    M : Natural := 5;

	type Tree is private;
	function New_Tree return Tree;
	procedure Insertion(T : in out Tree ; Word : in String);
	procedure Search_And_Display(T : in Tree ; Letters : in String);
    function Count_Occurrence(Word: in String; Letter: in Character) return Natural;
    procedure Insertion_arbre(T: in out Tree; Word: in String; Letter : in Character);
private
    
   --package Word_List is new Ada.Containers.Doubly_Linked_Lists(Natural);
   type Node;
   type Tree is access Node;
   type Child_Tab is array(0..M) of Tree;
 
   type Node is record
        letter : Character;
        occurrence : Natural;
        --words : Word_List;
        childs : Child_Tab;
   end record;
    
end Tree;
