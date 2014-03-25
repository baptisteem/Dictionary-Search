
package body Tree is

    procedure Search_And_Display(T : in Tree; Letters : in String) is
    begin
        null;
    end;

    procedure Insertion(T : in out Tree; Word : in String) is
    begin
        Init_Tree(T,'A',0);
    end;

    procedure Init_Tree(T : in out Tree; letter : in Character; occurrence : in Natural) is
    temp : Cursor;
    begin
        for i in 0..M loop
            T.next.append(new Node'(letter, occurrence, null));
            if occurrence = 0 then
                temp := T.next.first;
            else
                temp := temp.next; 
            end if;

            if letter = 'Z' then
                return;
            else
                Init_Tree(temp.element,character'succ(letter),occurrence);
            end if;
        end loop;
    end;

    -- Create a new tree with only one root node
    function New_Tree return Tree is
        T : Tree;
    begin
        return T;
    end;

end;
