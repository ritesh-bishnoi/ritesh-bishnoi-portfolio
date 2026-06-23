import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

import { Project, ProjectDocument } from './schemas/project.schema';
import { CreateProjectDto } from './dto/create-project.dto';
import { UpdateProjectDto } from './dto/update-project.dto';

@Injectable()
export class ProjectsService {
  constructor(
    @InjectModel(Project.name)
    private projectModel: Model<ProjectDocument>,
  ) {}

  // ✅ CREATE
  async create(dto: CreateProjectDto) {
    return this.projectModel.create(dto);
  }

  // ✅ CREATE All And Pagination method
  async findAll(page = 1, limit = 10) {
    const [data, total] = await Promise.all([
      this.projectModel
        .find()
        .sort({ createdAt: -1 })
        .skip((page - 1) * limit)
        .limit(limit),

      this.projectModel.countDocuments(),
    ]);

    return {
      data,
      total,
      page,
      totalPages: Math.ceil(total / limit),
    };
  }

  // ✅ GET ONE
  async findOne(id: string) {
    const project = await this.projectModel.findById(id);
    if (!project) throw new NotFoundException('Project not found');
    return project;
  }

  // ✅ UPDATE
  async update(id: string, dto: UpdateProjectDto) {
    const updated = await this.projectModel.findByIdAndUpdate(id, dto, {
      new: true,
    });

    if (!updated) throw new NotFoundException('Project not found');
    return updated;
  }

  // ✅ DELETE
  async remove(id: string) {
    const deleted = await this.projectModel.findByIdAndDelete(id);

    if (!deleted) throw new NotFoundException('Project not found');
    return { message: 'Project deleted successfully' };
  }
}
