	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080695FC
sub_080695FC: @ 0x080695FC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069612
	adds r0, r5, #0
	bl Proc_Break
	b _08069666
_08069612:
	ldr r4, _08069670 @ =0x0202012C
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08069666
	ldr r1, _08069674 @ =0x02020100
	ldr r0, _08069678 @ =0x02020104
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawUnitName
	ldr r1, _0806967C @ =0x02020108
	ldr r0, _08069680 @ =0x0202010A
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawPreLevelValue
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_08069666:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069670: .4byte 0x0202012C
_08069674: .4byte 0x02020100
_08069678: .4byte 0x02020104
_0806967C: .4byte 0x02020108
_08069680: .4byte 0x0202010A
