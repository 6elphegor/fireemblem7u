	.include "macro.inc"

	.syntax unified

	thumb_func_start GetClassDisplayFontInfo
GetClassDisplayFontInfo: @ 0x080B02E4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	cmp r1, #0x20
	beq _080B0310
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080B0304
	lsls r0, r1, #3
	ldr r1, _080B0300 @ =0x08CE6A78
	b _080B0318
	.align 2, 0
_080B0300: .4byte 0x08CE6A78
_080B0304:
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bls _080B0314
_080B0310:
	movs r0, #0
	b _080B031A
_080B0314:
	lsls r0, r2, #3
	ldr r1, _080B031C @ =0x08CE6C48
_080B0318:
	adds r0, r0, r1
_080B031A:
	bx lr
	.align 2, 0
_080B031C: .4byte 0x08CE6C48
