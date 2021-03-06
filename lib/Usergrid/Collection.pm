# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package Usergrid::Collection;

use Moose;
use namespace::autoclean;

has 'object'      => ( is => 'rw', required => 1 );
has 'iterator'    => ( is => 'rw', isa => 'Int', default => sub { -1 } );

sub has_next_entity {
  my $self = shift;
  my $next = $self->iterator + 1;
  return ($next >= 0 && $next < $self->count());
}

sub get_next_entity {
  my $self = shift;
  if ($self->has_next_entity()) {
    $self->iterator ($self->iterator + 1);
    return Usergrid::Entity->new ( object => $self->object->{'entities'}[$self->iterator] );
  }
  return undef;
}

sub count {
  my $self = shift;
  return scalar @{$self->object->{entities}};
}

sub reset_iterator {
  my $self = shift;
  $self->iterator (-1);
}

__PACKAGE__->meta->make_immutable;

1;
