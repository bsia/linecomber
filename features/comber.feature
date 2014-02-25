Feature: Comb through a text file and remove irrelevant lines
    In order to quickly filter out irrelevant lines of a file
    As a caller of the CLI
    I want to see only relevant lines from a text file

    Scenario: Display the lines of a file marked between begin and end matchers
        When I run `linecomber comb --filters begin:'^Class.*' end:'};' --file=../../test_data/test_file.txt`
        Then the output should contain "Test"

    Scenario: Display no lines 
        When I run `linecomber comb --file=../../test_data/test_file.txt`
        Then the output should contain "Test"
