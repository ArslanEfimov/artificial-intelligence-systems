
% Факты с одним аргументом

character('Super Sonic').
character('Super Mario').
character('Pac-Man').
character('Spider-Man').
character('Pikachu').
character('Steve').
character('Agent-47').
character('Lara Croft').
character('Kratos').
character('Kirito').
character('Asuna').

% Пол
gender(male).
gender(female).

% Способности

abilities(strong).
abilities(agile).
abilities(fast).
abilities(endurance).
abilities(smart).
abilities(combat_scills).

% Жанры игр 

genre(platformer).
genre(arcade).
genre(rpg).
genre(adventure).
genre(shooter).

% Связь персонажей и их пола
character_gender('Super Sonic', male).
character_gender('Super Mario', male).
character_gender('Pac-Man', male).
character_gender('Spider-Man', male).
character_gender('Pikachu', male).
character_gender('Steve', male).
character_gender('Agent-47', male).
character_gender('Kratos', male).
character_gender('Kirito', male).

character_gender('Lara Croft', female).
character_gender('Asuna', female).

% Факты с двумя аргументами
% Связь персонажей и их способностей

character_abilities('Super Sonic', fast, 10).
character_abilities('Pikachu', fast, 9).
character_abilities('Spider-Man', fast, 8).
character_abilities('Kirito', fast, 8).
character_abilities('Pac-Man', fast, 6).

character_abilities('Super Sonic', strong, 8).
character_abilities('Super Mario', strong, 7).
character_abilities('Kratos', strong, 10).
character_abilities('Kirito', strong, 7).

character_abilities('Kratos', endurance, 9).
character_abilities('Super Mario', endurance, 8).
character_abilities('Steve', endurance, 6).
character_abilities('Agent-47', endurance, 7).

character_abilities('Super Sonic', agile, 9).
character_abilities('Spider-Man', agile, 9).
character_abilities('Lara Croft', agile, 8).
character_abilities('Asuna', agile, 8).

character_abilities('Spider-Man', smart, 7).
character_abilities('Steve', smart, 7).
character_abilities('Agent-47', smart, 8).
character_abilities('Lara Croft', smart, 7).

character_abilities('Spider-Man', combat_scills, 8).
character_abilities('Kratos', combat_scills, 10).
character_abilities('Kirito', combat_scills, 9).
character_abilities('Asuna', combat_scills, 7).
character_abilities('Agent-47', combat_scills, 9).
% Связь персонажей и их жанров игр

character_game_genre('Super Sonic', platformer).
character_game_genre('Super Mario', platformer).

character_game_genre('Pac-Man', arcade).

character_game_genre('Pikachu', rpg).
character_game_genre('Kirito', rpg).
character_game_genre('Asuna', rpg).

character_game_genre('Spider-Man', adventure).
character_game_genre('Steve', adventure).
character_game_genre('Lara Croft', adventure).
character_game_genre('Kratos', adventure).

character_game_genre('Agent-47', shooter).


% Правила
% Определение самого быстрого персонажа

fastest_character(Character) :- 
    findall(Speed, character_abilities(_ , fast, Speed), Speeds),
    max_list(Speeds, MaxSpeed),
    character_abilities(Character, fast, MaxSpeed).


% Определение является ли персонаж мощным

powerful_character(Character) :- 
    character_abilities(Character, strong, StrongValue),
    StrongValue >= 7,
    character_abilities(Character, endurance, EnduranceValue),
    EnduranceValue >= 7.


% Определение сильнейшего персонажа

best_fighter(Character) :-
    findall(Skill, character_abilities(_, combat_scills, Skill), Skills),
    max_list(Skills, MaxSkill),
    character_abilities(Character, combat_scills, MaxSkill).


% Поиск персонажей, чей жанр игры совпадает с жанром игры другого персонажа

same_genre(Character1, Character2) :-
    character_game_genre(Character1, Genre),
    character_game_genre(Character2, Genre),
    Character1 \= Character2.

% Сравнение силы двух персонажей по способности

stronger(Character1, Character2, Ability) :-
    character_abilities(Character1, Ability, Strength1),
    character_abilities(Character2, Ability, Strength2),
    Strength1 > Strength2.

% Нахождение всех персонажей по полу

characters_by_gender(Gender, Character) :-
    character_gender(Character, Gender).


% Нахождение суммы очков силы персонажа

characters_total_points_powerful(Character, TotalPoints) :-
    findall(Point, character_abilities(Character, _ , Point), Points),
    sum_list(Points, TotalPoints).

