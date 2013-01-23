<section class="entry-content">
<h1 class="entry-title">$header{{ if $total }} <small>($total)</small>{{ endif }}</h1>

    {{ if $finding }}<h4>$finding</h4>{{ endif }}

    <div class="buttonbar">
        <form id="contacts-search-form" action="$cmd" method="get" >
            <span class="contacts-search-desc">$desc</span>
            <input type="text" name="search" id="contacts-search" class="search-input" onfocus="this.select();" value="$search" />
            <input type="submit" name="submit" id="contacts-search-submit" value="$submit" />
        </form>
    </div>
    
    $tabs


    {{ for $contacts as $contact }}
        {{ inc contact_template.tpl }}{{ endinc }}
    {{ endfor }}
    <div id="contact-edit-end"></div>

    $paginate


</section>

