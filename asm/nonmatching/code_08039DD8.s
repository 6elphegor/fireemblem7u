	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryDoDanceAdjacent
AiTryDoDanceAdjacent: @ 0x08039DD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	str r1, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _08039EB8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08039EB4
	ldr r0, _08039EBC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	ldr r0, _08039EC0 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08039EAE
_08039E28:
	ldr r0, _08039EC0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _08039EA8
	lsls r5, r1, #2
_08039E38:
	ldr r0, _08039EBC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08039EA2
	ldr r6, _08039EC4 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039EA2
	ldr r0, _08039EC8 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039EA2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08039EA2
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r8, r0
	bge _08039EA2
	ldrb r2, [r2, #8]
	mov r8, r2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_08039EA2:
	subs r4, #1
	cmp r4, #0
	bge _08039E38
_08039EA8:
	adds r1, r7, #0
	cmp r1, #0
	bge _08039E28
_08039EAE:
	mov r0, r8
	cmp r0, #0
	bne _08039ECC
_08039EB4:
	movs r0, #0
	b _08039EEA
	.align 2, 0
_08039EB8: .4byte 0x03004690
_08039EBC: .4byte 0x0202E3E4
_08039EC0: .4byte 0x0202E3D8
_08039EC4: .4byte 0x0202E3DC
_08039EC8: .4byte 0x0202BD48
_08039ECC:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #7
	mov r3, sb
	bl AiSetDecision
	movs r0, #1
_08039EEA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
