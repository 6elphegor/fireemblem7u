	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC87C
sub_080AC87C: @ 0x080AC87C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_080AC860
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC896
	ldr r0, _080AC89C @ =0x08CE5704
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x58]
_080AC896:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC89C: .4byte 0x08CE5704
