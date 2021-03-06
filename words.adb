with Ada.Text_IO, Tree;
use Ada.Text_IO, Tree;
with Ada.Command_Line;
use Ada.Command_Line;

procedure Words is 
	function Read_Words_File(File_Name: in String) return Tree.Tree is
      File : File_Type;
	  T : Tree.Tree := New_Tree;
	begin
      Open(File, In_File, File_Name);
	  while not End_Of_File(File) loop
		  declare
			  Line : String := Get_Line(File);
		  begin
			  Insertion(T, Line);
		  end;
	  end loop;
	  Close(File);
	  return T;
	end Read_Words_File;

	T : Tree.Tree;

begin
    if Argument_Count /= 1 then 
        Put_Line("Error : Please specify a file for dictionary");
        Set_Exit_Status(Failure);
        return;
    end if;
	T := Read_Words_File(Argument(1));
	Put_Line("Please enter some letters: ");
	while not End_Of_File(Standard_Input) loop
		declare
			Letters : String := Get_Line(Standard_Input);
		begin
			Search_And_Display(T, Letters);
			Put_Line("Please enter some letters: ");
		end;
	end loop;
end Words;
