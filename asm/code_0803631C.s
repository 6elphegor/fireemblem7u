	.include "macro.inc"

	.syntax unified

	thumb_func_start AiCountUnitsInRange
AiCountUnitsInRange: @ 0x0803631C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r1, _08036384 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	cmp r2, #0
	blt _08036378
	movs r3, #0
	ldrsh r7, [r1, r3]
	ldr r0, _08036388 @ =0x0202E3E8
	mov r8, r0
	ldr r3, _0803638C @ =0x0202E3DC
	mov ip, r3
_0803633C:
	subs r1, r7, #1
	subs r5, r2, #1
	cmp r1, #0
	blt _08036372
	mov r3, r8
	ldr r0, [r3]
	lsls r2, r2, #2
	adds r0, r2, r0
	ldr r3, [r0]
	mov r6, ip
_08036350:
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803636C
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803636C
	adds r4, #1
_0803636C:
	subs r1, #1
	cmp r1, #0
	bge _08036350
_08036372:
	adds r2, r5, #0
	cmp r2, #0
	bge _0803633C
_08036378:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036384: .4byte 0x0202E3D8
_08036388: .4byte 0x0202E3E8
_0803638C: .4byte 0x0202E3DC
