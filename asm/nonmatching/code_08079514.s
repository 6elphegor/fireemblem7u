	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBattleDefeatTalk
CheckBattleDefeatTalk: @ 0x08079514
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r1, _08079550 @ =0x08C9F2EC
	adds r0, r4, #0
	bl sub_08079368
	cmp r0, #0
	bne _0807954C
	ldr r6, _08079554 @ =0x0202BBF8
	ldr r1, _08079558 @ =0x08C9F22C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079534
	ldr r1, _0807955C @ =0x08C9F16C
_08079534:
	adds r0, r4, #0
	bl sub_080793B0
	cmp r0, #0
	bne _0807954C
	ldrb r6, [r6, #0x1b]
	cmp r6, #1
	beq _08079560
	cmp r5, #0xf
	beq _0807954C
	cmp r5, #0x15
	bne _08079560
_0807954C:
	movs r0, #1
	b _08079562
	.align 2, 0
_08079550: .4byte 0x08C9F2EC
_08079554: .4byte 0x0202BBF8
_08079558: .4byte 0x08C9F22C
_0807955C: .4byte 0x08C9F16C
_08079560:
	movs r0, #0
_08079562:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
