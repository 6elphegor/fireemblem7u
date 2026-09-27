	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AE6D0
sub_080AE6D0: @ 0x080AE6D0
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r0, r6, #1
	adds r5, r0, #4
	movs r0, #0x1f
	ands r5, r0
	lsls r0, r5, #5
	ldr r2, _080AE74C @ =0x02023C60
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x22
	adds r0, #2
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080AE6F4:
	strh r4, [r0]
	strh r4, [r1]
	adds r1, #2
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080AE6F4
	adds r0, r6, #0
	movs r1, #7
	bl __modsi3
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #4
	bl sub_080ADC24
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080ADD34
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080ADDB4
	ldr r1, _080AE750 @ =0x02022C60
	movs r2, #0
	adds r0, r7, #0
	adds r0, #0x62
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
_080AE736:
	strh r2, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080AE736
	movs r0, #5
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE74C: .4byte 0x02023C60
_080AE750: .4byte 0x02022C60
