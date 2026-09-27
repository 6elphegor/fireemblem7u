	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080222DC
sub_080222DC: @ 0x080222DC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08022334 @ =0x0203A85C
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x2a]
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08022338 @ =0xFFFFFF00
	ands r5, r2
	orrs r5, r0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _0802233C @ =0xFFFF00FF
	ands r5, r1
	orrs r5, r0
	ldr r0, _08022340 @ =0xFF00FFFF
	ands r5, r0
	movs r0, #0xc0
	lsls r0, r0, #0xb
	orrs r5, r0
	ldr r0, _08022344 @ =0x00FFFFFF
	ands r5, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	bl sub_08022360
	ldr r0, _08022348 @ =0x08B959D4
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	movs r0, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022334: .4byte 0x0203A85C
_08022338: .4byte 0xFFFFFF00
_0802233C: .4byte 0xFFFF00FF
_08022340: .4byte 0xFF00FFFF
_08022344: .4byte 0x00FFFFFF
_08022348: .4byte 0x08B959D4
