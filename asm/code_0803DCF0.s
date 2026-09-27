	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DCF0
sub_0803DCF0: @ 0x0803DCF0
	push {r4, r5, lr}
	ldr r5, _0803DD34 @ =0x0203D970
	movs r4, #5
_0803DCF6:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803DCF6
	ldr r5, _0803DD38 @ =0x0203D918
	movs r4, #0xa
_0803DD0A:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803DD0A
	ldr r5, _0803DD3C @ =0x0203DC08
	movs r4, #1
_0803DD1E:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803DD1E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DD34: .4byte 0x0203D970
_0803DD38: .4byte 0x0203D918
_0803DD3C: .4byte 0x0203DC08
