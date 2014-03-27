with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Tree is

    procedure Search_And_Display(T : in Tree; Letters : in String) is
    begin
        Search_And_Display_arbre(T,Letters,'a');
    end;

    procedure Search_And_Display_arbre(T: in Tree; Letters: in String; Letter: in Character) is
        cpt : Natural := 0;
    begin
        cpt := Count_Occurrence(Letters,Letter);
        if T.childs(cpt) /= null then
            --If we are not at the end we continue to go througt the tree
            if Letter /= 'z' then
                Search_And_Display_arbre(T.childs(cpt),Letters,character'succ(Letter));
            else
                --Use procedure display to display all words in the leaf
                iterate(T.childs(cpt).words,display'access);   
            end if;     
        else
            return;
        end if;
    end;

    --Take a cursor to display a list of string
    procedure display(C : Cursor) is
        word : Unbounded_String;
    begin
        word := Element(C);
        Put_Line(To_String(word));
    end;

    procedure Insertion(T : in out Tree; Word : in String) is
    begin
       Insertion_arbre(T,Word,'a');
    end;

    procedure Insertion_arbre(T: in out Tree; Word: in String; Letter : in Character) is
        cpt : Natural := 0;
    begin
        cpt := Count_Occurrence(Word,Letter);
        --If the node doesn't exist yet we create it
        if cpt <= M then
            if T.childs(cpt) = null then
                T.childs(cpt) := new Node;
                T.childs(cpt).letter := Letter;
                T.childs(cpt).occurrence := cpt;
             end if;
             if Letter /= 'z' then
                Insertion_arbre(T.childs(cpt),Word,character'succ(Letter));
             --When we are at the end of the tree we add the word to the list
             else
                 --Add word to the list
                 T.childs(cpt).words.Append(To_Unbounded_String(Word));
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
