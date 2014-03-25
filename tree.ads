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
    procedure Init_Tree(T : in out Tree; letter : in Character; occurrence : in Natural);

private
    
    type Node;    
    type Tree is access Node;

    package Node_List is new Ada.Containers.Doubly_Linked_Lists(Node);
    use Node_List;

    type Node is record
        letter : Character;
        occurrence : Natural;
        next : Node_List;
    end record;
end Tree;
