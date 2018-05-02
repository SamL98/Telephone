from string import punctuation

def RepresentsInt(s):
    try: 
        int(s)
        return True
    except ValueError:
        return False

mvocab = ['him', 'Him', 'himself', 'Himself', 'he', 'He', 'Mr', 'Mr.', 'hes', 'he\'s', 'Hes', 'He\'s']
fvocab = ['her', 'Her', 'herself', 'Herself', 'she', 'She', 'Mrs.', 'Mrs', 'Miss', 'miss', 'shes', 'she\'s', 'Shes', 'She\'s']

def process_line(line, wf):
    terms = line.split(',')

    new_terms = []
    full_text = ''
    shd_append = False
    for term in terms:
        if term != '' and term[0] == '\"':
            full_text = term
            shd_append = True
        elif shd_append:
            full_text += term
            if term[-1] == '\"':
                new_terms.append(full_text)
                shd_append = False
        else:
            new_terms.append(term)
    terms = new_terms

    if len(terms) != 7:
        #print(terms)
        return

    if not RepresentsInt(terms[-2]):
        #print(terms)
        return

    text = terms[-3]
    mcount = 0
    fcount = 0
    if text == '':
        return
    
    words = [word.strip(punctuation) for word in text.split(' ')]
    for m in mvocab:
        if m.strip(punctuation) in words:
            print(m)
            mcount += 1
    for f in fvocab:
        if f.strip(punctuation) in words:
            print(f)
            fcount += 1

    if mcount != 0 or fcount != 0:
        print(text)

    to_terms = [terms[-2], str(mcount), str(fcount)]
    wf.write(','.join(to_terms) + '\n')

with open('all-data.csv') as f:
    with open('gender-data.csv', 'w') as wf:
        wf.write('wave,male references,female references\n')

        for line in f:
            process_line(line, wf)