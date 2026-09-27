	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB32C
sub_080BB32C: @ 0x080BB32C
	push {lr}
	ldr r0, _080BB34C @ =0x02007508
	ldr r0, [r0]
	lsls r0, r0, #3
	asrs r0, r0, #6
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080BB350 @ =0x02007500
	ldr r1, [r1]
	strh r0, [r1]
	bl sub_080BB31C
	pop {r0}
	bx r0
	.align 2, 0
_080BB34C: .4byte 0x02007508
_080BB350: .4byte 0x02007500
