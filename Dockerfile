FROM licensefinder/license_finder

# Link to the checked out code
RUN ln -s /scan /github/workspace

CMD cd /scan && license_finder

