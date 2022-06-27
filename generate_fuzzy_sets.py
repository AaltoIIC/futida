import numpy as np

NUMBER_OF_FUZZY_SETS = 40 #Number of fuzzy sets
START = 0 #First mean for gaussian function
END = 10 #Last mean for gaussian function
SIGMA = 0.2 #Sigma for the membership function

def generate_membership_functions(number_of_fuzzy_sets, start, end, sigma):
    means = np.linspace(start, end, number_of_fuzzy_sets)
    string = "; ".join([str(mean) + ", " + str(sigma) for mean in means])
    print(string)

def main():
    #Examples for crane bridge
    generate_membership_functions(26, 0, 26, 0.5)
    #Example load tare
    generate_membership_functions(3, 0, 2, 0.4)
    #Example hoist position
    generate_membership_functions(10, 0, 3, 0.15)
    #Crane trolley
    generate_membership_functions(10, 0, 10, 0.5)
    #This function uses parameters defined at the beginning
    #generate_membership_functions(NUMBER_OF_FUZZY_SETS, START, END, SIGMA)

if __name__ == "__main__":
    main()

