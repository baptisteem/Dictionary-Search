with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists;

package Tree is

    --Max tree size
   M : Natural := 5;

   --Package initialization to use string list
   package Word_List is new Ada.Containers.Doubly_Linked_Lists(Unbounded_String);
   use Word_List;
   
   type Tree is private;

   --Create a new empty tree
   function New_Tree return Tree;
   --Insert a word within the tree
   procedure Insertion(T : in out Tree ; Word : in String);	
   --Look for all words in a tree containing all the "Letters"
   procedure Search_And_Display(T : in Tree ; Letters : in String);
   --Count how many time a letter appear within a word
   function Count_Occurrence(Word: in String; Letter: in Character) return Natural;
   --Recursive procedure called by insertion. Avoid to add a parameter to "Insertion"
   procedure Insertion_arbre(T: in out Tree; Word: in String; Letter : in Character);
   --Recursive procedure called by Search_And_Display. Avoid to add a parameter to "Search_And_Display"
   procedure Search_And_Display_arbre(T: in Tree; Letters: in String; Letter: in Character);
   --Display a list of string
   procedure display(C : Word_List.Cursor);

private
   
   type Node;
   type Tree is access Node;
   type Child_Tab is array(0..M) of Tree;
 
   type Node is record
        letter : Character; --Letter of the node
        occurrence : Natural; --How many time this letter appear
        childs : Child_Tab; -- Tab with all childs of this node
        words : Word_List.List; --If we are at the end this list contained all the correct word for this path
   end record;
    
end Tree;
