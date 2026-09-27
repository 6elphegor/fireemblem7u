	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080921E8
sub_080921E8: @ 0x080921E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08092ED4
	ldr r0, _08092218 @ =0x02012A20
	ldr r1, _0809221C @ =0x02022EA4
	adds r2, r5, #0
	movs r3, #0
	bl sub_080929D0
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092218: .4byte 0x02012A20
_0809221C: .4byte 0x02022EA4
