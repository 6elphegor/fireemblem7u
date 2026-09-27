	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AEF48
sub_080AEF48: @ 0x080AEF48
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x20
	bne _080AEF54
	movs r0, #8
	b _080AEF80
_080AEF54:
	adds r2, r1, #0
	subs r2, #0x61
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080AEF6C
	ldr r0, _080AEF68 @ =0x08CE5E9C
	adds r0, r2, r0
	b _080AEF7E
	.align 2, 0
_080AEF68: .4byte 0x08CE5E9C
_080AEF6C:
	subs r1, #0x41
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bls _080AEF7A
	movs r0, #0
	b _080AEF80
_080AEF7A:
	ldr r0, _080AEF84 @ =0x08CE5E9C
	adds r0, r1, r0
_080AEF7E:
	ldrb r0, [r0]
_080AEF80:
	bx lr
	.align 2, 0
_080AEF84: .4byte 0x08CE5E9C
