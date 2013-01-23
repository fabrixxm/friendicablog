<section class="entry-content">
    $default

    <div class="buttonbar">
        <a href="profile_photo" class="button" title="$profpic">$profpic</a>
        <a href="profile/$profile_id/view?tab=profile" class="button"  title="$viewprof">$viewprof</a>
        <a href="$profile_clone_link" class="button"  title="$cr_prof">$cl_prof</a>
    </div>
    {{ if  $disabled }}{{ else }}
    <div class="buttonbar">        
        <a href="$profile_drop_link" class="button" title="$del_prof" >$del_prof</a>
    </div>
    {{ endif }}

    <h1 class="entry-title">$banner</h1>

    <form id="profile-edit-form" name="form1" action="profiles/$profile_id" method="post" >
    
        <input type='hidden' name='form_security_token' value='$form_security_token'>

        <div class='field input'>
            <label for='id_profile_name'>* $lbl_profname</label>
            <input type="text" name='profile_name' id='id_profile_name' value="$profile_name">
        </div>
        
        <div class='field input'>
            <label for='id_name'>$lbl_fullname</label>
            <input type="text" name='name' id='id_name' value="$name">
        </div>        

        <div class='field input'>
            <label for='id_pdesc'>$lbl_title</label>
            <input type="text" name='pdesc' id='id_pdesc' value="$pdesc">
        </div>        

        <div class='field select'>
            <label for='gender-select'>$lbl_gender</label>
            $gender
        </div>        

        <div class='field multiselect'>
            <label for='dob-select'>$lbl_bd</label>
            <span class="multiselect">$dob $age</span>
        </div>        

        $hide_friends
        

    <div class="buttonbar">
        <input type="submit" name="submit" value="$submit" />
    </div>
    
        <div class='field input'>
            <label for='id_address'>$lbl_address</label>
            <input type="text" name='address' id='id_address' value="$address">
        </div>

        <div class='field input'>
            <label for='id_locality'>$lbl_city</label>
            <input type="text" name='locality' id='id_locality' value="$locality">
        </div>
        
        <div class='field input'>
            <label for='id_postal_code'>$lbl_zip</label>
            <input type="text" name='postal_code' id='id_postal_code' value="$postal_code">
        </div>
        
        <div class='field select'>
            <label for='id_country_name'>$lbl_country</label>
            <select name="country_name" id="id_country_name" onChange="Fill_States('$region');">
                <option selected="selected" >$country_name</option>
                <option>temp</option>
            </select>
        </div>
        
        <div class='field select'>
            <label for='id_region'>$lbl_region</label>
            <select name="region" id="id_region" onChange="Update_Globals();" >
                <option selected="selected" >$region</option>
                <option>temp</option>
            </select>
        </div>
        
        <div class='field input'>
            <label for='id_hometown'>$lbl_hometown</label>
            <input type="text" name='hometown' id='id_hometown' value="$hometown">
        </div>
        

    <div class="buttonbar" >
        <input type="submit" name="submit" value="$submit" />
    </div>


        <div class='field select'>
            <label for='profile-edit-marital'>$lbl_marital </label>
            $marital
        </div>

        <div class='field input'>
            <label for='id_with'>$lbl_with</label>
            <input type="text" name='with' id='id_with' value="$with">
        </div>
        
        <div class='field input'>
            <label for='id_howlong'>$lbl_howlong</label>
            <input type="text" name='howlong' id='id_howlong' value="$howlong">
        </div>
        

        <div class='field select'>
            <label for="sexual-select" >$lbl_sexual </label>
            $sexual
        </div>

        <div class='field input'>
            <label for='id_homepage'>$lbl_homepage</label>
            <input type="text" name='homepage' id='id_homepage' value="$homepage">
        </div>
        
        <div class='field input'>
            <label for='id_politic'>$lbl_politic</label>
            <input type="text" name='politic' id='id_politic' value="$politic">
        </div>
        
        <div class='field input'>
            <label for='id_religion'>$lbl_religion</label>
            <input type="text" name='religion' id='id_religion' value="$religion">
        </div>
        
        <div class='field input'>
            <label for='id_pub_keywords'>$lbl_pubkey</label>
            <input type="text" name='pub_keywords' id='id_pub_keywords' value="$pub_keywords">
            <span class='field_help'>$lbl_pubdsc</span>
        </div>
        
        <div class='field input'>
            <label for='id_prv_keywords'>$lbl_prvkey</label>
            <input type="text" name='prv_keywords' id='id_prv_keywords' value="$prv_keywords">
            <span class='field_help'>$lbl_prvdsc</span>
        </div>
        

    <div class="buttonbar" >
        <input type="submit" name="submit" value="$submit" />
    </div>


	
        <div class='field textarea'>
            <label for='id_about'>$lbl_about</label>
            <textarea name='about' id='id_about'  rows="5">$about</textarea>
        </div>


        <div class='field textarea'>
            <label for='id_interest'>$lbl_hobbies</label>
            <textarea name='interest' id='id_interest'  rows="5">$interest</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_likes'>$lbl_likes</label>
            <textarea name='likes' id='id_likes'  rows="5">$likes</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_dislikes'>$lbl_dislikes</label>
            <textarea name='dislikes' id='id_dislikes'  rows="5">$dislikes</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_contact'>$lbl_social</label>
            <textarea name='contact' id='id_contact'  rows="5">$contact</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_contact'>$lbl_social</label>
            <textarea name='contact' id='id_contact'  rows="5">$contact</textarea>
        </div>

    <div class="buttonbar" >
        <input type="submit" name="submit" value="$submit" />
    </div>


        <div class='field textarea'>
            <label for='id_music'>$lbl_music</label>
            <textarea name='music' id='id_music'  rows="5">$music</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_book'>$lbl_book</label>
            <textarea name='book' id='id_book'  rows="5">$book</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_tv'>$lbl_tv</label>
            <textarea name='tv' id='id_tv'  rows="5">$tv</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_film'>$lbl_film</label>
            <textarea name='film' id='id_film'  rows="5">$film</textarea>
        </div>

    <div class="buttonbar" >
        <input type="submit" name="submit" value="$submit" />
    </div>
    
    
        <div class='field textarea'>
            <label for='id_romance'>$lbl_love</label>
            <textarea name='romance' id='id_romance'  rows="5">$romance</textarea>
        </div>

        <div class='field textarea'>
            <label for='id_work'>$lbl_work</label>
            <textarea name='work' id='id_work'  rows="5">$work</textarea>
        </div>


        <div class='field textarea'>
            <label for='id_education'>$lbl_school</label>
            <textarea name='education' id='id_education'  rows="5">$education</textarea>
        </div>


    <div class="buttonbar" >
        <input type="submit" name="submit" value="$submit" />
    </div>
    
    </form>

    <script type="text/javascript">Fill_Country('$country_name');Fill_States('$region');</script>
</section>