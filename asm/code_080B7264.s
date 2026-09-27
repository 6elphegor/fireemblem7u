	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7264
sub_080B7264: @ 0x080B7264
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetCG
	movs r2, #0x3e
	ldrsh r1, [r4, r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r1, #0xb
	ldr r2, _080B72A4 @ =0x06008000
	adds r1, r1, r2
	bl Decompress
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080B729C
	adds r0, r4, #0
	bl Proc_Break
_080B729C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B72A4: .4byte 0x06008000
