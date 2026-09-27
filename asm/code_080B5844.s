	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5844
sub_080B5844: @ 0x080B5844
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5890 @ =0x08CE76E8
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B5894 @ =0x08CE77C0
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080B5898 @ =0x08194594
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _080B589C @ =0x02022860
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080B587A:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080B587A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5890: .4byte 0x08CE76E8
_080B5894: .4byte 0x08CE77C0
_080B5898: .4byte 0x08194594
_080B589C: .4byte 0x02022860
