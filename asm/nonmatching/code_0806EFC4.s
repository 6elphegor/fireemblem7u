	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806EFC4
sub_0806EFC4: @ 0x0806EFC4
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806F03C @ =0x0203A3F0
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x6b
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806F040 @ =0x0203E0FC
	ldr r1, _0806F044 @ =0x0203A4F0
	str r1, [r0, #0x50]
	bl Manim_AdvanceBattleRound
	ldr r0, _0806F03C @ =0x0203A3F0
	ldr r1, _0806F048 @ =0x0203A470
	ldr r2, _0806F044 @ =0x0203A4F0
	bl InitManimActors
	ldr r1, _0806F04C @ =0x08C9D48C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F03C: .4byte 0x0203A3F0
_0806F040: .4byte 0x0203E0FC
_0806F044: .4byte 0x0203A4F0
_0806F048: .4byte 0x0203A470
_0806F04C: .4byte 0x08C9D48C
