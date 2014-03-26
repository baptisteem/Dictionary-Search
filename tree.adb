with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Tree is

    procedure Search_And_Display(T : in Tree; Letters : in String) is
    begin
        null;
    end;

    procedure Insertion(T : in out Tree; Word : in String) is
    begin
       Insertion_arbre(T,Word,'A');
    end;

    procedure Insertion_arbre(T: in out Tree; Word: in String; Letter : in Character) is
        cpt : Natural := 0;
    begin
        cpt := Count_Occurrence(Word,Letter);
        if cpt <= M then 
            if T.childs(cpt) = null then
                T.childs(cpt) := new Node;
                T.childs(cpt).letter := Letter;
                T.childs(cpt).occurrence := cpt;
             end if;
             if Letter /= 'Z' then
                Insertion_arbre(T.childs(cpt),Word,character'succ(Letter));
             else
                 null; --Add word in the list
             end if;
        end if;
    end;
    
    -- Count how many "Letter" there is within "Word"
    function Count_Occurrence(Word : in String; Letter : in Character) return Natural is
        Cpt : Natural := 0;
    begin
        for i in 1..(Word'Length) loop
            if Word(i) = Letter then
                Cpt := Cpt+1;
            end if;
        end loop;

        return Cpt;
    end;

    -- Create a new tree with only one root node
    function New_Tree return Tree is
        T : Tree := new Node;
    begin
        return T;
    end;

end;
