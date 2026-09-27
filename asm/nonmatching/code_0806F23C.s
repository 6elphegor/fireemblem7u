	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleManim
StartBattleManim: @ 0x0806F23C
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F25C @ =0x0203A3D8
	ldrh r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806F260
	bl sub_0806F190
	b _0806F29E
	.align 2, 0
_0806F25C: .4byte 0x0203A3D8
_0806F260:
	ldr r0, _0806F2A4 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F2A4 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F2A8 @ =0x0203A3F0
	ldr r1, _0806F2AC @ =0x0203A470
	ldr r2, _0806F2B0 @ =0x0203A4F0
	bl InitManimHits
	ldr r0, _0806F2A8 @ =0x0203A3F0
	ldr r1, _0806F2AC @ =0x0203A470
	ldr r2, _0806F2B0 @ =0x0203A4F0
	bl InitManimActors
	ldr r1, _0806F2B4 @ =0x08C9D634
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_0806F29E:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F2A4: .4byte 0x0203E0FC
_0806F2A8: .4byte 0x0203A3F0
_0806F2AC: .4byte 0x0203A470
_0806F2B0: .4byte 0x0203A4F0
_0806F2B4: .4byte 0x08C9D634
