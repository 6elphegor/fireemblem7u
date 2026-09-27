	.include "macro.inc"

	.syntax unified

	thumb_func_start InitManimActors
InitManimActors: @ 0x0806F30C
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	movs r0, #0
	ldr r1, [r7]
	ldr r2, [r7]
	bl InitManimActor
	ldr r1, _0806F39C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bls _0806F340
	ldr r1, _0806F3A0 @ =0x0203A470
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r1, [r7, #4]
	ldr r2, [r7, #4]
	movs r0, #1
	bl InitManimActor
_0806F340:
	ldr r0, _0806F3A4 @ =0x0203A4F0
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F382
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r2, [r0, #0x10]
	movs r0, #2
	ldr r1, [r7]
	bl InitManimActor
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r2, [r0, #0x14]
	movs r0, #3
	ldr r1, [r7]
	bl InitManimActor
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r1, [r0, #0x10]
	adds r0, r1, #0
	bl HideUnitSprite
	ldr r0, _0806F3A8 @ =0x0203A3D8
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	bl HideUnitSprite
_0806F382:
	bl InitManimActorFacings
	movs r0, #0
	str r0, [r7, #0xc]
_0806F38A:
	ldr r1, _0806F39C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _0806F3AC
	b _0806F424
	.align 2, 0
_0806F39C: .4byte 0x0203E0FC
_0806F3A0: .4byte 0x0203A470
_0806F3A4: .4byte 0x0203A4F0
_0806F3A8: .4byte 0x0203A3D8
_0806F3AC:
	ldr r0, _0806F420 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _0806F420 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r1, [r2]
	adds r2, r1, #0
	adds r1, #0x72
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
	ldr r0, _0806F420 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl GetUnitMaxHp
	ldr r1, _0806F420 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806F38A
	.align 2, 0
_0806F420: .4byte 0x0203E0FC
_0806F424:
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F474 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F474: .4byte 0x03002870
