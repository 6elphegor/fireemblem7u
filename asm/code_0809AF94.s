	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809AF94
sub_0809AF94: @ 0x0809AF94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B028 @ =0x020229A2
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	subs r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809AFBC:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809AFE2
	movs r3, #0x1f
_0809AFE2:
	cmp r2, #0x1f
	ble _0809AFE8
	movs r2, #0x1f
_0809AFE8:
	cmp r0, #0x1f
	ble _0809AFEE
	movs r0, #0x1f
_0809AFEE:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809AFBC
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0
	bne _0809B01A
	adds r0, r6, #0
	bl Proc_Break
_0809B01A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B028: .4byte 0x020229A2
