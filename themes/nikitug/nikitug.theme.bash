#!/bin/bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX="${yellow}"
SCM_THEME_PROMPT_SUFFIX=" "

GIT_THEME_PROMPT_DIRTY="${reset_color} ✗"
GIT_THEME_PROMPT_CLEAN="${reset_color} ✓"
GIT_THEME_PROMPT_PREFIX="${yellow}"
GIT_THEME_PROMPT_SUFFIX=" "

RVM_THEME_PROMPT_PREFIX=""
RVM_THEME_PROMPT_SUFFIX=" "

function prompt_command()
{
    if [ "$(whoami)" = root ]
    then
      user_color=$red
      user_prompt_char="#"
    else
      user_color=$white
      user_prompt_char="→"
    fi

    prompt_underline="${black}${underline_black}                                       ${reset_color}${normal}"

    PS1="${prompt_underline}\n$(date "+%Y-%m-%d") \t ${purple}\u@\h ${reset_color}in ${background_black}\w${normal}\n${yellow}$(scm_prompt_info)${reset_color}${user_color}${user_prompt_char}${normal}${reset_color} "
}

PROMPT_COMMAND=prompt_command;
