	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010F0C
sub_08010F0C: @ 0x08010F0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08010F98 @ =0x06008000
	ldr r1, _08010F9C @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08010FA0 @ =0x02022960
	ldr r2, _08010FA4 @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _08010FA8 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _08010FAC @ =0x00008080
	adds r3, r5, #0
	ldr r2, _08010FB0 @ =0x02024460
	ldr r1, _08010FB4 @ =0x02023C60
	movs r4, #0x80
	lsls r4, r4, #3
_08010F3A:
	ldrh r5, [r2]
	adds r0, r3, r5
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _08010F3A
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r3, _08010FB8 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010F98: .4byte 0x06008000
_08010F9C: .4byte 0x06001000
_08010FA0: .4byte 0x02022960
_08010FA4: .4byte 0xFFFFFF00
_08010FA8: .4byte 0x001FFFFF
_08010FAC: .4byte 0x00008080
_08010FB0: .4byte 0x02024460
_08010FB4: .4byte 0x02023C60
_08010FB8: .4byte 0x03002870
