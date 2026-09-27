	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08070B60
sub_08070B60: @ 0x08070B60
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r0, [r1, r3]
	str r0, [r7, #8]
	ldr r1, _08070BA4 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070BAE
	bl sub_08071174
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _08070BA8
	b _08071074
	.align 2, 0
_08070BA4: .4byte 0x08B857F8
_08070BA8:
	ldr r0, [r7]
	bl Proc_Break
_08070BAE:
	ldr r1, _08070BCC @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070BD0
	movs r0, #0xa
	str r0, [r7, #0xc]
	b _08070BD4
	.align 2, 0
_08070BCC: .4byte 0x08B857F8
_08070BD0:
	movs r0, #1
	str r0, [r7, #0xc]
_08070BD4:
	ldr r1, _08070CEC @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _08070BEC
	b _08070D48
_08070BEC:
	ldr r1, _08070CF0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r5, #0
	ldrsh r2, [r3, r5]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _08070CF0 @ =0x08C9D938
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08070CF0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _08070CF4 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #6]
	cmp r0, r2
	blt _08070D48
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _08070CF8
	ldr r1, _08070CF0 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08070CF4 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08070D48
	.align 2, 0
_08070CEC: .4byte 0x08B857F8
_08070CF0: .4byte 0x08C9D938
_08070CF4: .4byte 0x08C9D8C0
_08070CF8:
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08070E68 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08070D48:
	ldr r1, _08070E6C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _08070D60
	b _08070EBC
_08070D60:
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r2, _08070E64 @ =0x08C9D938
	ldr r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #1
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r4, #0x64
	muls r3, r4, r3
	adds r2, r2, r3
	adds r3, r1, #0
	adds r3, #8
	adds r1, r3, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	ldrh r3, [r1]
	subs r1, r3, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r0, #8
	adds r1, r0, r1
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r1, _08070E68 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	cmp r0, r2
	bge _08070EBC
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _08070E70
	ldr r1, _08070E64 @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08070E68 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r3, [r1, #6]
	adds r2, r3, #0
	subs r1, r2, #1
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	b _08070EBC
	.align 2, 0
_08070E64: .4byte 0x08C9D938
_08070E68: .4byte 0x08C9D8C0
_08070E6C: .4byte 0x08B857F8
_08070E70:
	ldr r1, _0807107C @ =0x08C9D938
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0x64
	muls r2, r3, r2
	adds r1, r1, r2
	adds r2, r0, #0
	adds r2, #8
	adds r0, r2, r1
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	adds r1, r2, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070EBC:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x20
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070F2E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _08070F02
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08070F02:
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #3
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070F2E:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070FA0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #1
	beq _08070F74
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_08070F74:
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #4
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070FA0:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08070FE2
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #1
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08070FE2:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071024
	ldr r0, [r7]
	ldr r1, _08071080 @ =0x08C9D8C0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	movs r2, #2
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_08071024:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf0
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071044
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	movs r2, #1
	bl sub_08070324
_08071044:
	ldr r1, _08071084 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0xf3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08071074
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r5, #0
	ldrsh r0, [r1, r5]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	bl sub_08070324
_08071074:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807107C: .4byte 0x08C9D938
_08071080: .4byte 0x08C9D8C0
_08071084: .4byte 0x08B857F8
