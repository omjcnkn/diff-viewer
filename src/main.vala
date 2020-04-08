/* main.vala
 *
 * Copyright 2020 Mahmoud
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

int main (string[] args) {
	File repoFile = File.new_for_path ("../../../testing-repo");
	Ggit.init ();
	
	if (repoFile != null)
	{
		print ("Accessed repo file\n");
		print (repoFile.get_basename () + "\n");
		try
		{
			Ggit.Repository repo = Ggit.Repository.open (repoFile);
			if (repo != null)
			{
				print ("Repo isn't null\n");
				print ("Repo name : %s\n", repo.get_location ().get_basename ());
			}
			
			print ("=== Printing diff between working directory and HEAD===\n");
			
			Ggit.Diff diff = new Ggit.Diff.index_to_workdir (repo, null, null);
			diff.print (Ggit.DiffFormatType.PATCH, print_line_callback);
		}
		catch (Error error)
		{
			print ("Error thrown\n");
		}
	}
	else
	{
		print ("Pffs\n");
	}

	return 0;
}

public int print_line_callback (Ggit.DiffDelta delta, Ggit.DiffHunk? hunk, Ggit.DiffLine line)
{
	if (line.get_origin () == Ggit.DiffLineType.ADDITION)
	{
		print ("+ " + line.get_new_lineno ().to_string () + " : ");
		print (line.get_text () + "\n");
	}
	else if (line.get_origin () == Ggit.DiffLineType.DELETION)
	{
		print ("- " + line.get_old_lineno ().to_string () + " : ");
		print (line.get_text () + "\n");
	}
	
	return 0;
}
