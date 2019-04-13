import re
import sys
import pickle
import os.path

def matching(arg, pattern):
        ''' Filters the list 'arg' to only contain items matching 'pattern'
        '''
        pattern = re.compile(pattern)
        return [x for x in arg if pattern.match(x)]

def not_matching(arg, pattern):
        ''' Filters the list 'arg' to only contain items not matching 'pattern'
        '''
        pattern = re.compile(pattern)
        return [x for x in arg if not pattern.match(x)]

def attr_not_matching(arg, attr, pattern):
        ''' Filters the list 'arg' to only contain items not matching 'pattern'
        '''
        pattern = re.compile(pattern)
        return {key: value for key, value in arg.items() if not pattern.match(value[attr])}

def attr_in(arg, attr, checklist):
        ''' Filters the list 'arg' to only contain dicts where the attribute 'attr'
        is also in 'checklist'
        '''
        return [x for x in arg if x[attr] in checklist]

def first_sub(arg):
        ''' Maps the list of lists in arg to a list of the first elements of the sublists	'''
        return [x[0] for x in arg]

def key_only(arg):
        ''' Filters the list of dicts 'arg' to only contain the dict's keys
        '''
        return arg.keys()

def prepend(arg, prestr):
        return [str(prestr) + str(x) for x in arg]

class FilterModule(object):
        def filters(self):
                return {'matching': matching, 'not_matching': not_matching, 'attr_not_matching': attr_not_matching, 'attr_in': attr_in, 'keys': key_only, 'first_sub': first_sub, 'prepend': prepend}
