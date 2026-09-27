	.include "macro.inc"

	.syntax unified

	thumb_func_start AiStaffRestore
AiStaffRestore: @ 0x0803B1FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r1, _0803B32C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B31A
	ldr r0, _0803B330 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	bl sub_0801A0FC
	ldr r0, _0803B334 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B2FA
_0803B24A:
	ldr r0, _0803B334 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt _0803B2F4
	lsls r1, r7, #2
	mov r8, r1
_0803B25E:
	ldr r0, _0803B338 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B2EE
	ldr r0, _0803B33C @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B2EE
	bl GetUnit
	adds r5, r0, #0
	ldr r1, _0803B32C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B2A6
	mov r2, sb
	cmp r2, #0
	beq _0803B2A6
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B2EE
_0803B2A6:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B2EE
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _0803B2EE
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B2EE
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803B33C @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B2EE:
	subs r4, #1
	cmp r4, #0
	bge _0803B25E
_0803B2F4:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803B24A
_0803B2FA:
	mov r2, sl
	cmp r2, #0
	beq _0803B31A
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803B31A:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B32C: .4byte 0x0203A8EC
_0803B330: .4byte 0x03004690
_0803B334: .4byte 0x0202E3D8
_0803B338: .4byte 0x0202E3E4
_0803B33C: .4byte 0x0202E3DC
