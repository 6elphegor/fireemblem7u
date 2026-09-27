	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_InitTexts
PrepUnit_InitTexts: @ 0x080931A8
	push {r4, r5, lr}
	bl ResetText
	ldr r5, _080931FC @ =0x02012AA0
	movs r4, #0xd
_080931B2:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080931B2
	ldr r5, _08093200 @ =0x02012B10
	movs r4, #4
_080931C6:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080931C6
	ldr r4, _08093204 @ =0x02012B38
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl InitText
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xb
	bl InitText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080931FC: .4byte 0x02012AA0
_08093200: .4byte 0x02012B10
_08093204: .4byte 0x02012B38
