	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080446E0
sub_080446E0: @ 0x080446E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08044704 @ =0x02000C60
	bl SetTextFont
	ldr r0, _08044708 @ =0x02000C78
	ldr r3, [r4, #0x54]
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044704: .4byte 0x02000C60
_08044708: .4byte 0x02000C78
