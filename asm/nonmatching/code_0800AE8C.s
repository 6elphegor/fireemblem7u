	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AE8C
sub_0800AE8C: @ 0x0800AE8C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r0, _0800AEDC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0800AEE0 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl ClearTalk
	bl RefreshBMapGraphics
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800AEE4
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800AEEA
	movs r0, #0x20
	adds r1, r4, #0
	bl StartLockingFadeFromBlack
	b _0800AEEA
	.align 2, 0
_0800AEDC: .4byte 0x02022C60
_0800AEE0: .4byte 0x02023460
_0800AEE4:
	adds r0, r4, #0
	bl StartMidLockingFadeFromBlack
_0800AEEA:
	pop {r4, r5}
	pop {r0}
	bx r0
