	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveTactician
SaveTactician: @ 0x0803F6C4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803F702
	movs r0, #2
	bl SioPlaySoundEffect
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F6F4
	ldr r0, _0803F6F0 @ =0x0203D90C
	ldrb r1, [r0, #3]
	adds r0, r4, #0
	bl SioUpdateTeam
	b _0803F6FA
	.align 2, 0
_0803F6F0: .4byte 0x0203D90C
_0803F6F4:
	adds r0, r4, #0
	bl SetTacticianName
_0803F6FA:
	adds r0, r5, #0
	bl Proc_Break
	b _0803F708
_0803F702:
	movs r0, #0
	bl SioPlaySoundEffect
_0803F708:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
