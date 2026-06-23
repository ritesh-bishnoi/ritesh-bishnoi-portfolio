import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type ProjectDocument = Project & Document;

@Schema({ timestamps: true })
export class Project {
  @Prop({ required: true })
  title!: string;

  @Prop()
  description?: string;

  @Prop([String])
  techStack?: string[];

  @Prop()
  githubUrl?: string;

  @Prop()
  liveUrl?: string;

  @Prop()
  imageUrl?: string;
}

export const ProjectSchema = SchemaFactory.createForClass(Project);
