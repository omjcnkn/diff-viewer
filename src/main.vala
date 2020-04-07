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
	File repoFile = File.new_for_path ("../.././");
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
			}
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
