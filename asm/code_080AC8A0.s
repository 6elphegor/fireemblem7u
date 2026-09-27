	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC8A0
sub_080AC8A0: @ 0x080AC8A0
	push {r4, lr}
	ldr r0, _080AC8D8 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080AC8B2
	movs r2, #0
_080AC8B2:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080AC8F6
	cmp r2, #0x63
	bhi _080AC8E4
	ldr r1, _080AC8DC @ =0x04000050
	movs r0, #0xc1
	strh r0, [r1]
	ldr r4, _080AC8E0 @ =0x04000054
	movs r0, #0x64
	subs r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
	b _080AC8F6
	.align 2, 0
_080AC8D8: .4byte 0x04000006
_080AC8DC: .4byte 0x04000050
_080AC8E0: .4byte 0x04000054
_080AC8E4:
	ldr r1, _080AC8FC @ =0x04000050
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080AC900 @ =0x0000100A
	adds r0, r2, #0
	strh r0, [r1]
_080AC8F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC8FC: .4byte 0x04000050
_080AC900: .4byte 0x0000100A
