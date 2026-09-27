	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809218C
sub_0809218C: @ 0x0809218C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080921E0 @ =0x02022EC4
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08091F04
	ldr r0, _080921E4 @ =sub_080918F4
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r4, #0
	bl StartHelpPromptSprite
	adds r4, #0x2d
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921E0: .4byte 0x02022EC4
_080921E4: .4byte sub_080918F4
