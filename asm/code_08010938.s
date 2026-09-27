	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010938
sub_08010938: @ 0x08010938
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080109A0 @ =0x06008000
	ldr r1, _080109A4 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _080109A8 @ =0x02022960
	ldr r2, _080109AC @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _080109B0 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _080109B4 @ =0x00008080
	adds r4, r5, #0
	ldr r3, _080109B8 @ =0x02024460
	ldr r2, _080109BC @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #3
_08010966:
	ldrh r5, [r3]
	adds r0, r4, r5
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08010966
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _080109C0 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080109A0: .4byte 0x06008000
_080109A4: .4byte 0x06001000
_080109A8: .4byte 0x02022960
_080109AC: .4byte 0xFFFFFF00
_080109B0: .4byte 0x001FFFFF
_080109B4: .4byte 0x00008080
_080109B8: .4byte 0x02024460
_080109BC: .4byte 0x02023C60
_080109C0: .4byte 0x03002870
