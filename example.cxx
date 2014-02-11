#include <iostream>
#include "TAtomicMass.h"


int main()
{

	std::cout
		<< "The nuclear mass of 11Li is " << gAtomicMassTable->NuclearMassAMU("11Li") << " u, or "
		<< gAtomicMassTable->NuclearMass(3, 11) / 1e3 << " MeV/c^2.\n";
	
}
