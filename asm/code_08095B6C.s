	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095B6C
sub_08095B6C: @ 0x08095B6C
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _08095B94 @ =0x02023FFE
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r5, #0
	bne _08095B98
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08095BB4
	.align 2, 0
_08095B94: .4byte 0x02023FFE
_08095B98:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _08095BA2
	subs r0, #1
	str r0, [r4, #0x30]
_08095BA2:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_08095BB4:
	ldr r0, _08095BE8 @ =0x02022EA4
	ldr r1, _08095BEC @ =0x02012A20
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl DrawPrepScreenItems
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_08094EF4
	movs r0, #0
	bl DisableUiCursorHand
	bl sub_0807453C
	movs r0, #5
	bl EnableBgSync
	ldr r0, _08095BF0 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095BE8: .4byte 0x02022EA4
_08095BEC: .4byte 0x02012A20
_08095BF0: .4byte 0x06014000
