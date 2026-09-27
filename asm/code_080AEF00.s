	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AEF00
sub_080AEF00: @ 0x080AEF00
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r3, r1, #0
	movs r2, #0
	cmp r1, #0x20
	bne _080AEF14
	ldr r0, _080AEF10 @ =0x0000FFFF
	b _080AEF46
	.align 2, 0
_080AEF10: .4byte 0x0000FFFF
_080AEF14:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080AEF24
	adds r2, r1, #0
	subs r2, #0x47
_080AEF24:
	adds r1, r3, #0
	subs r1, #0x41
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080AEF32
	adds r2, r1, #0
_080AEF32:
	adds r1, r2, #0
	cmp r2, #0
	bge _080AEF3A
	adds r1, #0xf
_080AEF3A:
	asrs r1, r1, #4
	lsls r0, r1, #7
	lsls r1, r1, #4
	subs r1, r2, r1
	lsls r1, r1, #1
	adds r0, r0, r1
_080AEF46:
	bx lr
