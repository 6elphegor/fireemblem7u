	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080325A0
sub_080325A0: @ 0x080325A0
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _08032604 @ =0x08405450
	ldr r1, _08032608 @ =0x06015000
	bl Decompress
	ldr r0, _0803260C @ =0x08405670
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08032610 @ =0x08B969E4
	movs r1, #3
	bl Proc_Start
	ldr r4, _08032614 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080325E0
	ldr r0, _08032618 @ =0x0000038A
	bl m4aSongNumStart
_080325E0:
	adds r3, r4, #0
	adds r3, #0x42
	ldrb r2, [r3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1f
	movs r1, #1
	subs r1, r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032604: .4byte 0x08405450
_08032608: .4byte 0x06015000
_0803260C: .4byte 0x08405670
_08032610: .4byte 0x08B969E4
_08032614: .4byte 0x0202BBF8
_08032618: .4byte 0x0000038A
